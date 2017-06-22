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
        if($activity->image == null)
          $activity->image = "img/inf.png";
        if($activity->Teacher->image == null)
          $activity->Teacher->image = "img/unknown.gif";
        $this->view->activity = $activity;
      }
    }
}
