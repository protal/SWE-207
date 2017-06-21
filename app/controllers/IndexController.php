<?php
use Phalcon\Paginator\Adapter\Model as Paginator;
class IndexController extends ControllerBase
{

    public function indexAction()
    {
      $numberPage = $this->request->getQuery("page", "int");
      $s = $this->request->get("s");
      $activity = Activity::query()
                ->where("name like '%".$s."%'")

                ->execute();
      $paginator = new Paginator([
        'data' => $activity,
        'limit'=> 6,
        'page' => $numberPage
      ]);

      $this->tag->setDefault("s", $s);
      $this->view->page = $paginator->getPaginate();
      $this->view->s = $s;
    }

}
