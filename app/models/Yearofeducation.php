<?php

class Yearofeducation extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Column(type="integer", length=11, nullable=false)
     */
    public $semester;

    /**
     *
     * @var integer
     * @Primary
     * @Column(type="integer", length=11, nullable=false)
     */
    public $Year;

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
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("swe-207");
        $this->hasMany('semester', 'Activity', 'yearofeducation_semester', ['alias' => 'Activity']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'yearofeducation';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Yearofeducation[]|Yearofeducation
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Yearofeducation
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
