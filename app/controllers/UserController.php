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
    }
}
