<?php
use Phalcon\Paginator\Adapter\Model as Paginator;

class ActivityController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }
    public function showAction($id)
    {
      $activity = Activity::findFirst($id);
      if(!$activity)
      {
        $this->flashSession->error("ไม่พบหน้า");
        return $this->response->redirect("");
      }
      else {
        $this->view->activity = $activity;
      }
    }
}
