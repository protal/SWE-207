<?php

class AuthController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }
    public function loginAction()
    {

    }
    public function logoutAction()
    {
      $this->session->destroy();
      $this->flashSession->success("ออกจาระบบสำเร็จ");
      return $this->response->redirect("auth/login");
    }
    public function checkLoginAction()
    {
      $username = $this->request->getPost("username");
      $password = $this->request->getPost("password");

      $user = Users::findFirst(
        [
        "username = '" . $username . "'"
        ]
      );


      if ($user) {
        if ($this->security->checkHash($password, $user->password)) {
          $this->session->set("auth", $user->toArray());
          $this->flashSession->success("ยินดีต้อนรับ คุณ ".$user->Firstname." เข้าสู่ระบบ");
          return $this->response->redirect("manage/index");
        }
        else{
          $this->flashSession->error("เข้าสู่ระบบผิดพลาด , กรุณาลองใหม่อีกครั้ง");
          return $this->response->redirect("auth/login");
        }
      } else {
        $this->flashSession->error("เข้าสู่ระบบผิดพลาด , กรุณาลองใหม่อีกครั้ง");
        return $this->response->redirect("auth/login");
      }
  }
}
