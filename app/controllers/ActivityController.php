<?php
use Phalcon\Paginator\Adapter\Model as Paginator;

class ActivityController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }
    public function showAction($id)
    {
      $numberPage = $this->request->getQuery("page", "int");
      $s = $this->request->get("s" = "id");
      $activity = Activity::query()
                ->where("name like '%".$s."%'")
                ->orwhere("Datail like '%".$s."%'")
                ->execute();
      $paginator = new Paginator([
        'data' => $activity,
        'limit'=> 1,
        'page' => $numberPage
      ]);

      $this->tag->setDefault("s", $s);
      $this->view->page = $paginator->getPaginate();
      $this->view->s = $s;
    }
}
