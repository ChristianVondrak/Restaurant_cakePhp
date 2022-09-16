<?php 

class Mesero extends AppModel{

    public $virtualFields = array('nombre_completo'=>
        'CONCAT(Mesero.nombre, " ", Mesero.apellido)');


    public $validate = array(
        'dni'=>array(
            'notEmpty'=>array(
                'rule' => 'notBlank'
            ),
            'numeric'=>array(
                'rule'=>'numeric',
                'message'=>'Solo numeros'
            ),
            'unique'=>array(
                'rule'=>'IsUnique',
                'message'=>'El DNI ya se encuentra en nuestra base de datos'
            )
        ),
        'nombre'=>array(
            'rule'=>'notBlank'
        ),
        'apellido'=>array(
            'rule'=>'notBlank'
        ),
        'telefono'=>array(
            'notEmpty'=>array(
                'rule' => 'notBlank'
            ),
            'numeric'=>array(
                'rule'=>'numeric',
                'message'=>'Solo numeros'
            )
        )
    );

    public $hasMany = array(
        'Mesa'=>array(
            'className'=>'Mesa',
            'foreingkey'=>'mesero_id',
            'conditions'=>'',
            'order'=>'Mesa.codigo DESC',
            'depend'=> false         
        )
    );


}