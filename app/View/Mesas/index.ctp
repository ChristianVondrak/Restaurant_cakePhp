<h2>Lista de Mesas</h2>

<?php 
echo $this->Html->link('Crear nueva mesa',
 array('controller'=>'mesas', 'action'=>'nuevo'))
?>

<table>
    <tr>
        <td><strong>Codigo</strong></td>
        <td><strong>Puestos</strong></td>
        <td><strong>Posicion</strong></td>
        <td><strong>Creado</strong></td>
        <td><strong>Modificado</strong></td>
        <td><strong>Responsable</strong></td>
        <td><strong>Edicion</strong></td>
        <td><strong>Eliminacion</strong></td>
    </tr>

    <?php foreach($mesas as $mesa): ?>
        <tr>
            <td><?php echo $mesa['Mesa']['codigo']; ?></td>
            <td><?php echo $mesa['Mesa']['puestos']; ?></td>
            <td><?php echo $mesa['Mesa']['posicion']; ?></td>
            <td><?php echo $this->Time->format('d-m-Y ; h:i A', $mesa['Mesa']['created']); ?></td>
            <td><?php echo $this->Time->format('d-m-Y ; h:i A', $mesa['Mesa']['modified']); ?></td>
            <td><?php echo $this->Html->link($mesa['Mesero']['nombre']. ' '. $mesa['Mesero']['apellido'],
            array('controller'=>'meseros','action'=>'ver', $mesa['Mesero']['id'])); ?></td>
            <td><?php echo $this->Html->link('Editar', array('controller'=>'mesas', 'action'=>'editar', $mesa['Mesa']['id'])); ?></td>
            <td><?php echo $this->Form->postLink('Eliminar', array('action'=>'eliminar', $mesa['Mesa']['id']),array('confirm'=>'Eliminar mesa '. $mesa['Mesa']['codigo'])); ?></td>
        </tr>
    <?php endforeach; ?>
</table>