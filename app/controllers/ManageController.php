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
     $stdid = "";
   }
   // end student add
   public function studentdeleteAction(){

   }
   public function registerAction()
   {

   }
}
