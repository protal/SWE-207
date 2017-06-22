<?php

class UserController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }


    public function profileAction($id)
    {
      $user = Users::findFirst($id);
      if(!$user)
      {
        $this->flashSession->error("ไม่พบหน้า");
        return $this->response->redirect("");
      }
      else {
        $this->view->user = $user;
      }
      if($user->isteacher)
      {
        $activitys =  Activity::find(["create_id = ".$id." or teacher_id  = ".$id]);
      }
      else {
        $activitys = JoinActivity::find(["joined = 1 and user_id  = ".$user->id]);
      }
      $this->view->activitys = $activitys;
    }
}
