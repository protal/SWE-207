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
     $parameters["order"] = "id DESC";
     $activity = Activity::find($parameters);
     $paginator = new Paginator([
       'data' => $activity,
       'limit'=> 10,
       'page' => $numberPage
     ]);
     $this->view->page = $paginator->getPaginate();
   }
   public function teachersearchAction(){
     $numberPage = $this->request->getQuery("page", "int");
     $parameters["order"] = "id DESC";
     $users = Users::find($parameters);
     $paginator = new Paginator([
       'data' => $users,
       'limit'=> 10,
       'page' => $numberPage
     ]);
     $this->view->page = $paginator->getPaginate();
   }
   public function teachereditAction(){

   }
   public function teacherupdateAction(){

   }
   public function teacheraddAction(){

   }
   public function teacherdeleteAction(){

   }
   public function studentsearchAction(){
     $numberPage = $this->request->getQuery("page", "int");
     $parameters["order"] = "id DESC";
     $users = Users::find($parameters);
     $paginator = new Paginator([
       'data' => $users,
       'limit'=> 10,
       'page' => $numberPage
     ]);
     $this->view->page = $paginator->getPaginate();
   }


   public function studenteditAction(){

   }
   public function studentupdateAction(){

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
       $user->password = $this->security->hash($this->request->getPost("username"));
       $user->isteacher	= 0 ;
       $user->Firstname = $this->request->getPost("Firstname");
       $user->Lastname	= $this->request->getPost("Lastname");
       $user->Years	= $this->request->getPost("Years");
       if($user->save())
       {
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
   public function studentdeleteAction(){

   }
   public function registerAction()
   {

   }
}
