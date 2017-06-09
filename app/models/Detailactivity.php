<?php

class Detailactivity extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Column(type="integer", length=11, nullable=false)
     */
    public $user_id;

    /**
     *
     * @var integer
     * @Primary
     * @Column(type="integer", length=11, nullable=false)
     */
    public $activity_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("swe-207");
        $this->belongsTo('user_id', '\Users', 'id', ['alias' => 'Users']);
        $this->belongsTo('activity_id', '\Activity', 'id', ['alias' => 'Activity']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'detailactivity';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Detailactivity[]|Detailactivity
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Detailactivity
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
