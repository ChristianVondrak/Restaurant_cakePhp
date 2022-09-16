<h2>Editar mesa</h2>

<?php 
echo $this->Form->create('Mesa');
echo $this->Form->input('codigo');
echo $this->Form->input('puestos');
echo $this->Form->input('posicion',array('rows'=>3));
echo $this->Form->input('mesero_id');
echo $this->Form->end('Editar Mesa');

?>