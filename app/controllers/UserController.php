<?php

class UserController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {
      $teacher = User::find([])

    }


    public function profileAction()
    {
      $user->username = $this->request->getPost("username");
      $user = Users::findFirst($id);
      $this->tag->setDefault("username", $user->username);
      $this->tag->setDefault("Firstname", $user->Firstname);
      $this->tag->setDefault("Lastname", $user->Lastname);
      $this->tag->setDefault("Years", $user->Years);
      $this->view->id  = $id;
    }

}
