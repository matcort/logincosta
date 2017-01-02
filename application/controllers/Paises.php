<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Paises extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	
	public function __construct() {
		parent::__construct();
		$this->load->model('Pais_model');
	}

	public function listar_paises() {
	    $paises = $this->Pais_model->get_paises()->result();	    
	    $retorno = json_encode($paises);
	    	    
	    header('Content-Type: application/json');
	    echo $retorno;
		return;
	}	

	public function index() {
		$this->load->view('lista_paises');
	}

	/*public function listarAsignaturas() {
    $this->output
      ->set_content_type('application/json')
      ->set_output(json_encode(array('data' => ($this->Asignaturas_model->get_asignaturas() != false > 0 ? $this->Asignaturas_model->get_asignaturas()->result() : ''))));
			  
	}
	public function eliminar() {
		$cod = $this->input->post('id');

		$this->Asignaturas_model->delete_asignatura($cod);
		$this->output
		  ->set_content_type('application/json')
		  ->set_output(json_encode(array('mensaje' => 'Asignatura eliminada satisfactoriamente.')));
	}

	public function agregar() {
		$cod = $this->input->post('codigo');
		$nom = $this->input->post('nombre');
		$nalu = $this->input->post('cantidadAumnos');

		$this->Asignaturas_model->set_asignatura($cod, $nom, $nalu);
    $this->output
      ->set_content_type('application/json')
      ->set_output(json_encode(array('mensaje' => 'La asignatura se ha agregado satisfactoriamente.')));
	}

	public function editar() {
		$cod = $this->input->post('codigo');
		$nom = $this->input->post('nombre');
		$nalu = $this->input->post('cantidadAlumnos');

		$this->Asignaturas_model->update_asignatura($cod, $nom, $nalu);
		// La asignatura se ha editado satisfactoriamente.
    $this->output
      ->set_content_type('application/json')
      ->set_output(json_encode(array('mensaje' => 'La asignatura se ha editado satisfactoriamente.')));
	}*/
}
