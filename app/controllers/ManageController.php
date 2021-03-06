<?php
use Phalcon\Paginator\Adapter\Model as Paginator;
class ManageController extends \Phalcon\Mvc\Controller
{
    public function initialize()
    {
      if(!$this->session->has("auth"))
      {
        $this->flashSession->error("ไม่สามารถเข้าหน้านี้ได้  กรุณาเข้าสู่ระบบ");
        return $this->response->redirect("auth/login");
      }
    }
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
                ->order("id DESC")
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
   public function activityeditAction($id){
     //type
     $types = Type::find()->toArray();
     $types_arr = array();
     foreach ($types as $type) {
       $types_arr[$type['id']] = $type['name'];
     }
     $this->view->type_id  = $types_arr;

    //  location
     $locations = Location::find()->toArray();
     $locations_arr = array();
     foreach ($locations as $location) {
       $locations_arr[$location['id']] = $location['name']."  ( ".$location['room']." )";
     }
     $this->view->location_id  = $locations_arr;

    //  user teacher
    $locations = Location::find()->toArray();
    $locations_arr = array();
    foreach ($locations as $location) {
      $locations_arr[$location['id']] = $location['name']."  ( ".$location['room']." )";
    }
    $this->view->location_id  = $locations_arr;

    //
    $users = Users::find(["isteacher = 1"])->toArray();
    $users_arr = array();
    foreach ($users as $user) {
      $users_arr[$user['id']] = $user['prefix']." ".$user['Firstname']."  ".$user['Lastname'];
    }
    $this->view->users_id  = $users_arr;


    $users = Users::find(["conditions"=>"isteacher = 0","order" => "Years DESC","group"=>"Years"])->toArray();
    $users_arr = array();
    foreach ($users as $user) {
      array_push($users_arr,$user['Years']);
    }
    $this->view->years  = $users_arr;

    $activity = Activity::findFirst($id);
    $this->tag->setDefault("name", $activity->name);
    $this->tag->setDefault("type_id", $activity->type_id);
    $this->tag->setDefault("activitydetail", $activity->Datail);
    $this->tag->setDefault("Yearstart", date("Y-m-d",$activity->StartDate));
    $this->tag->setDefault("Yearend", date("Y-m-d",$activity->EndDate));
    $this->tag->setDefault("semester", $activity->yearofeducation_semester);
    $this->tag->setDefault("Year", $activity->yearofeducation_year);
    $this->tag->setDefault("teacher_id", $activity->teacher_id);
    $this->tag->setDefault("location_id", $activity->location_id);
    $this->view->id  = $id;

   }
   public function activityaddpostAction(){
     $years = explode("-",$this->request->get("Yearstart"));
     $StartDate = $years[0];
     $EndDate = $years[1];

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
       $this->flashSession->error("ไม่สำเร็จ  YOE[". $ms ."]");
       return $this->response->redirect("manage/activityadd");
     }

     if ($_FILES['file']['size']>0) {
       $files = $this->request->getUploadedFiles();
       foreach ($files as $file) {
           // Print file details
           $name = $id.'-'. $file->getName() ;
           $path = 'img/activity/'.$name;
           echo $file->getName(), ' ', $file->getSize(), '\n';

           // Move the file into the application
           $file->moveTo(
               $path
           );
       }
     }

     //create_activity
     $activity = new Activity;
     $activity->name = $this->request->get("name");
     $activity->Datail = $this->request->get("activitydetail");
     $activity->StartDate	= $StartDate;
     $activity->EndDate = $EndDate;
    //  var_dump($activity->StartDate);
    //  exit();
     $activity->yearofeducation_semester = $this->request->get("semester");
     $activity->yearofeducation_year = $this->request->get("Year");
     $activity->teacher_id = $this->request->get("teacher_id");
     $activity->create_id	= $this->session->get('auth')["id"];
     $activity->location_id = $this->request->get("location_id");
     $activity->type_id = $this->request->get("type_id");

     if(isset($path))
       $activity->image = $path;


     if(!$activity->save())
     {
       $ms = "";
       foreach ($activity->getMessages() as $message) {
          $ms .= $message;
        }
       $this->flashSession->error("ไม่สำเร็จ  activity[". $ms ."]");
       return $this->response->redirect("manage/activityadd");
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
    $this->flashSession->success("เพิ่มกิจกรรมสำเร็จ");
    return $this->response->redirect("manage/activitysearch");

   }
   public function activityupdateAction($id){

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
            $this->flashSession->error("ไม่สำเร็จ  YOE[". $ms ."]");
            return $this->response->redirect("manage/activityedit/".$id);
          }

          if ($_FILES['file']['size']>0) {
            $files = $this->request->getUploadedFiles();
            foreach ($files as $file) {
                // Print file details
                $name = $id.'-'. $file->getName() ;
                $path = 'img/activity/'.$name;
                echo $file->getName(), ' ', $file->getSize(), '\n';

                // Move the file into the application
                $file->moveTo(
                    $path
                );
            }
          }


          //create_activity
          $activity = Activity::findFirst($id);
          $years = explode("-",$this->request->get("Yearstart"));
          $StartDate = $years[0];
          $EndDate = $years[1];

          $activity->name = $this->request->get("name");
          $activity->Datail = $this->request->get("activitydetail");
          $activity->StartDate	= $StartDate;
          $activity->EndDate = $EndDate;
          $activity->yearofeducation_semester = $this->request->get("semester");
          $activity->yearofeducation_year = $this->request->get("Year");
          $activity->teacher_id = $this->request->get("teacher_id");
          $activity->location_id = $this->request->get("location_id");;
          $activity->type_id = $this->request->get("type_id");

          if(isset($path))
            $activity->image = $path;


          if(!$activity->save())
          {
            $ms = "";
            foreach ($activity->getMessages() as $message) {
               $ms .= $message;
             }
            $this->flashSession->error("ไม่สำเร็จ  activity[". $ms ."]");
            return $this->response->redirect("manage/activityedit/".$id);

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


         $activity->joinActivity->delete();

         foreach ($users_array as $user) {
           $join = new joinActivity;
           $join->activity_id = $activity->id;
           $join->user_id = $user['id'];
           $join->save();
         }
         $this->flashSession->success("แก้ไขกิจกรรมสำเร็จ");
         return $this->response->redirect("manage/activitysearch/".$id);


   }
   public function activityaddAction(){

     //type
     $types = Type::find()->toArray();
     $types_arr = array();
     foreach ($types as $type) {
       $types_arr[$type['id']] = $type['name'];
     }
     $this->view->type_id  = $types_arr;

    //  location
     $locations = Location::find()->toArray();
     $locations_arr = array();
     foreach ($locations as $location) {
       $locations_arr[$location['id']] = $location['name']."  ( ".$location['room']." )";
     }
     $this->view->location_id  = $locations_arr;

    //  user teacher
    $locations = Location::find()->toArray();
    $locations_arr = array();
    foreach ($locations as $location) {
      $locations_arr[$location['id']] = $location['name']."  ( ".$location['room']." )";
    }
    $this->view->location_id  = $locations_arr;

    //
    $users = Users::find(["isteacher = 1"])->toArray();
    $users_arr = array();
    foreach ($users as $user) {
      $users_arr[$user['id']] = $user['prefix']." ".$user['Firstname']."  ".$user['Lastname'];
    }
    $this->view->users_id  = $users_arr;


    $users = Users::find(["conditions"=>"isteacher = 0","order" => "Years DESC","group"=>"Years"])->toArray();
    $users_arr = array();
    foreach ($users as $user) {
      array_push($users_arr,$user['Years']);
    }
    $this->view->years  = $users_arr;
    //  var_dump($users_arr);exit;

   }
   public function activitydeleteAction($id){

       $activity = Activity::findFirst($id);
       $name = $activity->name;
       $activity->JoinActivity->delete();
       if($activity->delete())
       {
         $this->flashSession->success("ลบข้อมูล ".$name." เรียร้อยเเล้ว");
       }
       else {
         $this->flashSession->error("ลบข้อมูลไม่สำเสร็จ");
       }
       return $this->response->redirect("manage/activitysearch");
   }
   public function activitystudentAction($id){
     $students = joinActivity::find(["activity_id = ".$id]);

     $this->view->students = $students;
    //  var_dump($students->toArray());exit();

   }
   public function studentcheckAction()
   {
     $data = $this->request->get("data");
     $data = explode("|",$data);
     $activity_id = $data[0];
     $user_id = $data[1];

     $JoinActivity = JoinActivity::findFirst(["activity_id = ".$activity_id." and user_id = ".$user_id]);
     if($JoinActivity)
     {
       $JoinActivity->joined = ($JoinActivity->joined)?"0":"1";
       $JoinActivity->save();
       echo "SUCESS|".$activity_id."|".$user_id;
     }
     else {
       echo "FAIL";
     }
     exit();
   }
   public function teachersearchAction(){
     if(!$this->session->get("auth")["isadmin"])
     {
       $this->flashSession->error("ไม่สามาถเข้าถึงหน้านี้ได้");
       return $this->response->redirect("manage");
     }

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
          " id != ".$id." and username = '" . $username . "'"
       ]
     );
     if ($user)
     {
       $this->flashSession->error("ชื่อผู้ใช้ ". $username ." ได้ใช้งานไปแล้ว กรุณาลองใหม่อีกครั้ง");
       return $this->response->redirect("manage/teachersearch");
     }
     else {
     $user = Users::findFirst($id);
     $user->username = $this->request->getPost("username");
     $user->password = $this->security->hash($this->request->getPost("password"));
     $user->prefix = $this->request->getPost("prefix");
     $user->Firstname = $this->request->getPost("Firstname");
     $user->Lastname = $this->request->getPost("Lastname");
     $user->email	= $this->request->getPost("email");
     $user->isAdmin	= $this->request->getPost("isAdmin");
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

      if(!$this->session->get("auth")["isadmin"])
      {
        $this->flashSession->error("ไม่สามาถเข้าถึงหน้านี้ได้");
        return $this->response->redirect("manage");
      }

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
     $this->tag->setDefault("prefix",$user->prefix);
     $this->tag->setDefault("username", $user->username);
     $this->tag->setDefault("Firstname", $user->Firstname);
     $this->tag->setDefault("Lastname", $user->Lastname);
     $this->tag->setDefault("Years", $user->Years);
     $this->tag->setDefault("email", $user->email);

     $this->view->id  = $id;
   }
   public function profileUpdateAction()
   {
        if($this->request->getPost("password")!=$this->request->getPost("repassword"))
        {
          $this->flashSession->error("รหัสผ่านไม่ตรงกัน");
          return $this->response->redirect("manage/profile");
        }
        if ($_FILES['file']['size']>0) {
          $files = $this->request->getUploadedFiles();
          foreach ($files as $file) {
              // Print file details
              $name = $this->session->get('auth')["id"]. $file->getName() ;
              $path = 'img/user/'.$name;
              echo $file->getName(), ' ', $file->getSize(), '\n';

              // Move the file into the application
              $file->moveTo(
                  $path
              );
          }
        }

       $user = Users::findFirst($this->session->get('auth')["id"]);
       $user->password = $this->security->hash($this->request->getPost("password"));
       $user->Firstname = $this->request->getPost("Firstname");
       $user->Lastname = $this->request->getPost("Lastname");
       $user->prefix =  $this->request->getPost("prefix");
       $user->email =  $this->request->getPost("email");
       if(isset($path))
        $user->image = $path;
       if($user->save())
       {
         $this->flashSession->success("แก้ไขข้อมูลเรียร้อยเเล้ว");
       }
       else {
         $this->flashSession->error("แก้ไม่สำเสร็จ");
       }

       $this->session->set("auth", $user->toArray());
       return $this->response->redirect("manage/profile");

   }
   public function locationsearchAction()
   {
     $location = $this->request->get("s");
     $loaction = $this->request->getQuery("page", "int");
     $location = Location::query()

     ->where("name like '%".$s."%'")
     ->orwhere("room like '%".$s."%'")
     ->execute();
     $paginator = new Paginator([
       'data' => $location,
       'limit'=> 10,
       'page' => $numberPage
     ]);
     $this->tag->setDefault("s", $s);
     $this->view->page = $paginator->getPaginate();
     $this->view->s = $s;
   }
   public function locationeditAction($id)
   {
     $location = Location::findFirst($id);
     $this->tag->setDefault("name", $location->name);
     $this->tag->setDefault("room", $location->room);
     $this->view->id=$id;
   }
   public function locationUpdateAction($id){

     $location = $this->request->getPost("name");
     $location = Location::findFirst($id);
     $location->name = $this->request->getPost("name");
     $location->room = $this->request->getPost("room");
     if($location->save())
     {
       $this->flashSession->success("แก้ไขข้อมูล ".$name." เรียร้อยเเล้ว");
     }
     else {
       $this->flashSession->error("แก้ไม่สำเสร็จ");
     }
     return $this->response->redirect("manage/locationsearch/".$id);

   }

   public function locationaddAction()
   {

   }
   public function locationaddpostAction()
   {
       $location = new Location;
       $location->name = $this->request->getPost("name");
       $location->room = $this->request->getPost("room");
       if($location->save())
       {
         //success
         $this->flashSession->success("เพิ่มสถานที่ ". $location->name ." ห้อง ".$location->room." สำเร็จ");
         return $this->response->redirect("manage/locationsearch");
       }
       else {
         $ms = "";
         foreach ($location->getMessages() as $message) {
            $ms .= $message;
          }
         $this->flashSession->error("ไม่สำเร็จ  [". $ms ."]");
         return $this->response->redirect("manage/locationadd");
       }
     }

   public function locationdeleteAction($id)
   {
     $location = $this->request->getPost("Firstname");
     $location = location::findFirst($id);
     if($location->delete())
     {
       $this->flashSession->success("ลบ ".$location->name." ห้อง ".$location->room." เรียบร้อยเเล้ว");
     }
     else {
       $this->flashSession->error("ลบห้องไม่สำเสร็จ");
     }
     return $this->response->redirect("manage/locationsearch");

   }


   private function imageCheck($extension)
    {
        $allowedTypes = [
            'image/gif',
            'image/jpg',
            'image/png',
            'image/bmp',
            'image/jpeg'
        ];

        return in_array($extension, $allowedTypes);
    }
}
