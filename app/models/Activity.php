<?php

class Activity extends \Phalcon\Mvc\Model
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
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $Datail;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $StartDate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $EndDate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $YearSTD;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $teacher_id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $yearofeducation_semester;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $yearofeducation_year;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $location_id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $type_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("swe-207");
        $this->hasMany('id', 'Detailactivity', 'activity_id', ['alias' => 'Detailactivity']);
        $this->belongsTo('yearofeducation_semester', '\Yearofeducation', 'semester', ['alias' => 'Yearofeducation']);
        $this->belongsTo('teacher_id', '\Teacher', 'id', ['alias' => 'Teacher']);
        $this->belongsTo('type_id', '\Type', 'id', ['alias' => 'Type']);
        $this->belongsTo('location_id', '\Location', 'id', ['alias' => 'Location']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'activity';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Activity[]|Activity
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Activity
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
