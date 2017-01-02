<?php
if(!defined('BASEPATH')) exit('No direct script access allowed');

class Pais_model extends CI_Model {
  
  public function __construct() {
    parent::__construct();
  }
/*
  public function set_pais($id, $nom) {
    $data = array(
      'PAI_ID' => $id,
      'PAI_NONBRE' => $nom      
    );

    $this->db->insert('SGC_PAIS', $data);
  }

  public function delete_pais($id) {
    $data = array(
      'PAI_ID' => $id
    );

    $this->db->delete('SGC_PAIS', $data);
  }

  public function update_pais($id, $nom) {
    $this->db->set('PAI_NOMBRE', $nom);
    $this->db->where('PAI_ID', $cod);
    $this->db->update('SGC_PAIS');
  }
*/
  public function get_paises() {
    $this->db->select('*');
    $this->db->from('SGC.SGC_PAIS');
    $this->db->order_by('PAI_NOMBRE DESC');
    $query = $this->db->get();    
    if($query->num_rows() > 0) {
      return $query;
    } else {
      return false;
    }
  }
}

?>