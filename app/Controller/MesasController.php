<?php 

class MesasController extends AppController{
    public $helpers = array('Html','Form','Time');
    public $components = array('Session');

    public function index(){
        $this->set('mesas',$this->Mesa->find('all'));
    }

    public function nuevo(){
        if ($this->request->is('post')) {
            $this->Mesa->create();
            if($this->Mesa->save($this->request->data)){
                $this->Session->setFlash('La mesa ha sido creada','default',
                array('class'=>'success'));
                return $this->redirect(array('action'=>'index'));
            }
            $this->Session->setFlash('No se pudo crear la mesa');
        }
        $meseros = $this->Mesa->Mesero->find('list', array('fields'=>array('id','nombre_completo')));
        $this->set('meseros',$meseros);
    }

    public function editar($id = null){
        if (!$id) {
            throw new NotFoundException("Datos invalidos");
        }
        $mesa = $this->Mesa->findById($id);
        if (!$mesa) {
            throw new NotFoundException("La mesa no fue encontrada");
        }
        if($this->request->is(array('post','put'))){
            $this->Mesa->id = $id;
            if($this->Mesa->save($this->request->data)){
                $this->Session->setFlash('La mesa ha sido modificada','default',
                array('class'=>'success'));
                return $this->redirect(array('action'=>'index'));
            }
            $this->Session->setFlash('El registro no pudo ser modificado');
        }
        if(!$this->request->data){
            $this->request->data=$mesa;
        }
        $meseros = $this->Mesa->Mesero->find('list', array('fields'=>array('id','nombre_completo')));
        $this->set('meseros',$meseros);

        } 

        public function eliminar($id){
            if($this->request->is('get')){
                throw new MethodNotAllowedException("INCORRECTO");
            }
            if($this->Mesa->delete($id)){
                $this->Session->setFlash('La mesa ha sido eliminada','default',
                array('class'=>'success'));
                return $this->redirect(array('action'=>'index'));
            }
        }
}