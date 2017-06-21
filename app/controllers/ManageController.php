<?php
use Phalcon\Paginator\Adapter\Model as Paginator;
class ManageController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }
    public function activitysearchAction()
    {
      $numberPage = $this->request->getQuery("page", "int");
      $s = $this->request->get("s");
      $activity = Activity::query()
                ->where("name like '%".$s."%'")
                ->orwhere("Datail like '%".$s."%'")
                ->order("id ASC")
                ->execute();
      $paginator = new Paginator([
        'data' => $activity,
        'limit'=> 60,
        'page' => $numberPage
      ]);

      $this->tag->setDefault("s", $s);
      $this->view->page = $paginator->getPaginate();
      $this->view->s = $s;
   }
   public function activityeditAction(){

   }
   public function activityaddpostAction(){

     //create YOD
     $semester = $this->request->get("semester");
     $Year = $this->request->get("Year");
     $yearofeducation = new Yearofeducation;
     $yearofeducation->semester = $semester;
     $yearofeducation->Year = $Year;
     if(!$yearofeducation->save())
     {
       $ms = "";
       foreach ($yearofeducation->getMessages() as $message) {
          $ms .= $message;
        }
       $this->flashSession->error("ไม่สำเร็จ  [". $ms ."]");
     }

     //create_activity
     $activity = new Activity;
     $activity->name = $this->request->get("name");
     $activity->Datail = $this->request->get("activitydetail");
     $activity->StartDate	= $this->request->get("Yearstart");
     $activity->EndDate = $this->request->get("Yearend");
     $activity->yearofeducation_semester = $this->request->get("semester");
     $activity->yearofeducation_year = $this->request->get("Year");
     $activity->teacher_id = 1;
     $activity->create_id	= $this->session->get('auth')["id"];
     $activity->location_id = 1;
     $activity->type_id = $this->request->get("type_id");
     if(!$activity->save())
     {
       $ms = "";
       foreach ($yearofeducation->getMessages() as $message) {
          $ms .= $message;
        }
       $this->flashSession->error("ไม่สำเร็จ  [". $ms ."]");
     }

    //  MAKE JOIN STUDENT
    $years = $this->request->get("years");
    $users = Users::query();

    foreach ($years as $year) {
      $users = $users->orwhere("Years = ".$year);
    }
    $users = $users->andwhere("isteacher =  0")
            ->execute();
    $users_array = $users->toArray();

    foreach ($users_array as $user) {
      $join = new joinActivity;
      $join->activity_id = $activity->id;
      $join->user_id = $user['id'];
      $join->save();
    }
    var_dump($users_array);exit;

   }
   public function activityupdateAction(){

   }
   public function activityaddAction(){

   }
   public function activitydeleteAction(){

   }
   public function activitystudentAction(){

   }
   public function teachersearchAction(){
     $numberPage = $this->request->getQuery("page", "int");
     $s = $this->request->get("s");
     $users = Users::query()
               ->where("username like '%".$s."%'")
               ->orwhere("Firstname like '%".$s."%'")
               ->orwhere("Lastname like '%".$s."%'")
               ->andwhere("isteacher = 1")
               ->order("id ASC")
               ->execute();
     $paginator = new Paginator([
       'data' => $users,
       'limit'=> 10,
       'page' => $numberPage
     ]);

     $this->tag->setDefault("s", $s);
     $this->view->page = $paginator->getPaginate();
     $this->view->s = $s;
   }
   public function teachereditAction($id){
     $user = Users::findFirst($id);
     $this->tag->setDefault("username", $user->username);
     $this->tag->setDefault("prefix", $user->prefix);
     $this->tag->setDefault("Firstname", $user->Firstname);
     $this->tag->setDefault("Lastname", $user->Lastname);
     $this->tag->setDefault("email", $user->email);

     $this->view->id  = $id;
   }
   public function teacherupdateAction($id){
     $username = $this->request->getPost("username");
     $user = Users::findFirst(
       [
          "username = '" . $username . "'"
       ]
     );
     if ($user)
     {
       $this->flashSession->error("ชื่อผู้ใช้ ". $username ." ได้ใช้งานไปแล้ว กรุณาลองใหม่อีกครั้ง");
       return $this->response->redirect("manage/teachersearch");
     }
     else {
     $user = new Users;
     $user->username = $this->request->getPost("username");
     $user->password = $this->security->hash($this->request->getPost("password"));
     $user->prefix = $this->request->getPost("prefix");
     $user->Firstname = $this->request->getPost("Firstname");
     $user->Lastname = $this->request->getPost("Lastname");
     $user->email	= $this->request->getPost("email");
     if($user->save())
     {
       $this->flashSession->success("แก้ไขข้อมูล ".$name." เรียร้อยเเล้ว");
     }
     else {
       $this->flashSession->error("แก้ไม่สำเสร็จ");
     }
     return $this->response->redirect("manage/teachersearch/");
   }
 }

   public function teacheraddAction(){

   }
   public function teacherAddPostAction(){
        $username = $this->request->getPost("username");
       $user = Users::findFirst(
         [
            "username = '" . $username . "'"
         ]
       );
       if ($user)
       {
         $this->flashSession->error("ชื่อผู้ใช้ ". $username ." ถูกสร้างเเล้ว กรุณาลองใหม่อีกครั้ง");
         return $this->response->redirect("manage/teacheradd");
       }
       else {
         //add user
         $user = new Users;
         $user->username = $this->request->getPost("username");
         $user->password = $this->security->hash($this->request->getPost("password"));
         $user->isteacher	= 1 ;
         $user->prefix = $this->request->getPost("prefix");
         $user->Firstname = $this->request->getPost("Firstname");
         $user->Lastname	= $this->request->getPost("Lastname");
         $user->isadmin	= ($this->request->getPost("isAdmin")==1)?1:0;
         $user->email	= $this->request->getPost("email");
         if($user->save())
         {
           //success
           $this->flashSession->success("เพิ่มอาจารย์  ". $user->Firstname ." สำเร็จ");
           return $this->response->redirect("manage/teachersearch");
         }
         else {
           $ms = "";
           foreach ($user->getMessages() as $message) {
              $ms .= $message;
            }
           $this->flashSession->error("ไม่สำเร็จ  [". $ms ."]");
           return $this->response->redirect("manage/teacheradd");
         }
       }

     //$this->flashSession->error("ยังไม่ทำใจเย็น");
     //return $this->response->redirect("manage/teacheradd/".$id);

   }
   public function teacherdeleteAction($id){
     $name = $this->request->getPost("Firstname");
     $user = Users::findFirst($id);
     if($user->delete())
     {
       $this->flashSession->success("ลบข้อมูล ".$name." เรียร้อยเเล้ว");
     }
     else {
       $this->flashSession->error("ลบข้อมูลไม่สำเสร็จ");
     }
     return $this->response->redirect("manage/teachersearch");
   }
    public function studentsearchAction(){

     $s = $this->request->get("s");

     $numberPage = $this->request->getQuery("page", "int");

     $users = Users::query()

     ->where("username like '%".$s."%'")
     ->orwhere("Firstname like '%".$s."%'")
     ->orwhere("Lastname like '%".$s."%'")
     ->orwhere("Years like '%".$s."%'")
     ->andwhere("isteacher = 0")
     ->order("Years desc,username ASC")
     ->execute();
     $paginator = new Paginator([
       'data' => $users,
       'limit'=> 10,
       'page' => $numberPage
     ]);
     $this->tag->setDefault("s", $s);
     $this->view->page = $paginator->getPaginate();
     $this->view->s = $s;
   }


   public function studenteditAction($id){
     $user = Users::findFirst($id);
     $this->tag->setDefault("username", $user->username);
     $this->tag->setDefault("Firstname", $user->Firstname);
     $this->tag->setDefault("Lastname", $user->Lastname);
     $this->tag->setDefault("Years", $user->Years);

     $this->view->id  = $id;
   }
   public function studentupdateAction($id){
     $name = $this->request->getPost("Firstname");
     $user = Users::findFirst($id);
     $user->password = $this->security->hash($this->request->getPost("password"));
     $user->Firstname = $this->request->getPost("Firstname");
     $user->Lastname = $this->request->getPost("Lastname");
     $user->Years = $this->request->getPost("Years");
     if($user->save())
     {
       $this->flashSession->success("แก้ไขข้อมูล ".$name." เรียร้อยเเล้ว");
     }
     else {
       $this->flashSession->error("แก้ไม่สำเสร็จ");
     }
     return $this->response->redirect("manage/studentedit/".$id);

   }
   //  student add
   public function studentaddAction(){

   }
   public function studentaddpostAction(){
     $username = $this->request->getPost("username");
     $user = Users::findFirst(
       [
          "username = '" . $username . "'"
       ]
     );
     if ($user)
     {
       $this->flashSession->error("รหัสนักศึกษา  ". $username ." ถูกสร้างเเล้ว กรุณาลองใหม่อีกครั้ง");
       return $this->response->redirect("manage/studentadd");
     }
     else {
       //add user
       $user = new Users;
       $user->username = $this->request->getPost("username");
       $user->password = $this->security->hash($this->request->getPost("password"));
       $user->isteacher	= 0 ;
       $user->Firstname = $this->request->getPost("Firstname");
       $user->Lastname	= $this->request->getPost("Lastname");
       $user->Years	= $this->request->getPost("Years");
       if($user->save())
       {
         //success
         $this->flashSession->success("เพิ่มรหัสนักศึกษา  ". $username ." สำเร็จ");
         return $this->response->redirect("manage/studentsearch");
       }
       else {
         $ms = "";
         foreach ($user->getMessages() as $message) {
            $ms .= $message;
          }
         $this->flashSession->error("ไม่สำเร็จ  [". $ms ."]");
         return $this->response->redirect("manage/studentadd");
       }
     }
   }
   // end student add
   public function studentdeleteAction($id){
     $name = $this->request->getPost("Firstname");
     $user = Users::findFirst($id);
     if($user->delete())
     {
       $this->flashSession->success("ลบข้อมูล ".$name." เรียร้อยเเล้ว");
     }
     else {
       $this->flashSession->error("ลบข้อมูลไม่สำเสร็จ");
     }
     return $this->response->redirect("manage/studentsearch");
   }
   public function registerAction()
   {

   }

   public function profileAction()
   {
     $user = Users::findFirst($this->session->get('auth')["id"]);
     $this->tag->setDefault("username", $user->username);
     $this->tag->setDefault("Firstname", $user->Firstname);
     $this->tag->setDefault("Lastname", $user->Lastname);
     $this->tag->setDefault("Years", $user->Years);

     $this->view->id  = $id;
   }
   public function profileUpdateAction()
   {
        if($this->request->getPost("password")!=$this->request->getPost("repassword"))
        {
          $this->flashSession->error("รหัสผ่านไม่ตรงกัน");
          return $this->response->redirect("manage/profile");
        }

       $user = Users::findFirst($this->session->get('auth')["id"]);
       $user->password = $this->security->hash($this->request->getPost("password"));
       $user->Firstname = $this->request->getPost("Firstname");
       $user->Lastname = $this->request->getPost("Lastname");
       $user->Years = $this->request->getPost("Years");
       if($user->save())
       {
         $this->flashSession->success("แก้ไขข้อมูลเรียร้อยเเล้ว");
       }
       else {
         $this->flashSession->error("แก้ไม่สำเสร็จ");
       }
       return $this->response->redirect("manage/profile");

   }
   public function locationsearchAction()
   {

   }
   public function locationeditAction()
   {

   }
   public function locationaddAction()
   {

   }
   public function locationaddpostAction()
   {

   }
   public function locationdeleteAction()
   {

   }
}
