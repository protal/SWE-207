<?php

class AuthController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }
    public function loginAction()
    {

    }
    public function checkLoginAction()
    {
      $email = $this->request->getPost("email");
    $password = $this->request->getPost("password");
    $user = Users::findFirst(

    [
    "username = '" . $email . "'"
    ]
    );
    if (!$user) {
          $this->flashSession->error("invalid  login: " . $email . ",
          Please try again");
          return $this->response->redirect("auth/login");
    }

    if ($user) {
    if ($this->security->checkHash($password, $user->password)) {
      $this->session->set("email", $email);
      return $this->response->redirect("manage/index");
    }
    } else {
      $this->flashSession->success("Unsuccessful login, please try again");
      return $this->response->redirect("password/login");
    }
  }
}
