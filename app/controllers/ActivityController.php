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
      $this->view->activity = $activity;
    }
}
