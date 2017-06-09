<?php

class Teacher extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $Firstname;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $Lastname;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("swe-207");
        $this->hasMany('id', 'Activity', 'teacher_id', ['alias' => 'Activity']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'teacher';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Teacher[]|Teacher
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Teacher
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
