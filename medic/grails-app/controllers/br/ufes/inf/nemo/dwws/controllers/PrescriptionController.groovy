package br.ufes.inf.nemo.dwws.controllers

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import br.ufes.inf.nemo.dwws.domains.Appointment
import br.ufes.inf.nemo.dwws.domains.Diagnostic;
import br.ufes.inf.nemo.dwws.domains.Prescription

import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Literal;

@Transactional(readOnly = true)
class PrescriptionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
//	def berlin = graphService.get("http://dbpedia.org/resource/Berlin", vocab.dbpedia.City)


    def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        respond Prescription.list(), model:[prescriptionInstanceCount: Prescription.count()]
    }

    def show(Prescription prescriptionInstance) {
        respond prescriptionInstance
    }
	
//	def list(Diagnostic diagnosticInstance)
	def list()
	{
		def list = []
		String query = "";
		query += "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> ";
		query += "PREFIX db: <http://bio2rdf.org/drugbank_vocabulary:> ";
		query += "PREFIX dcterms: <http://purl.org/dc/terms/> ";
		query += "SELECT ?brand ?drug ?dosage ?indication ?brand_uri ?drug_uri ?dosage_uri ?indication_uri ";
		query += " WHERE ";
		query += " { ";
		query += "		?drug_uri a db:Drug . ";
		query += "		?drug_uri dcterms:title ?drug . ";
		query += "		?drug_uri db:brand ?brand_uri . ";
		query += "		?brand_uri dcterms:title ?brand . ";
		query += "		?drug_uri db:dosage ?dosage_uri . ";
		query += "		?dosage_uri dcterms:title ?dosage . ";
		query += "		?drug_uri db:indication ?indication_uri . ";
		query += "		?indication_uri dcterms:description ?indication . ";
		//query += "	    FILTER regex(?indication, \"${diagnosticInstance.disease}\", \"i\"). ";
		query += " }";
		
		QueryExecution queryExecution = QueryExecutionFactory.sparqlService("http://drugbank.bio2rdf.org/sparql", query);
		ResultSet resultSet = queryExecution.execSelect();
		while(resultSet.hasNext())
		{
			QuerySolution querySolution =  resultSet.next();
			
			list.add([brand:querySolution.getLiteral("brand").getString(), 
					   drug:querySolution.getLiteral("drug").getString(), 
					 dosage:querySolution.getLiteral("dosage").getString(),
				 indication:querySolution.getLiteral("indication").getString()])
		}
		respond list, [formats:['json']] 
	}

    def create(Diagnostic diagnosticInstance) {

		Prescription prescriptionInstace = new Prescription();
		diagnosticInstance.addToPrescriptions(prescriptionInstace)		
		
        respond prescriptionInstace
    }
	
    @Transactional
    def save(Prescription prescriptionInstance) {
        if (prescriptionInstance == null) {
            notFound()
            return
        }

        if (prescriptionInstance.hasErrors()) {
            respond prescriptionInstance.errors, view:'create'
            return
        }

        prescriptionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prescription.label', default: 'Prescription'), prescriptionInstance.id])
                redirect prescriptionInstance
            }
            '*' { respond prescriptionInstance, [status: CREATED] }
        }
    }

    def edit(Prescription prescriptionInstance) {
        respond prescriptionInstance
    }

    @Transactional
    def update(Prescription prescriptionInstance) {
        if (prescriptionInstance == null) {
            notFound()
            return
        }

        if (prescriptionInstance.hasErrors()) {
            respond prescriptionInstance.errors, view:'edit'
            return
        }

        prescriptionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Prescription.label', default: 'Prescription'), prescriptionInstance.id])
                redirect prescriptionInstance
            }
            '*'{ respond prescriptionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Prescription prescriptionInstance) {

        if (prescriptionInstance == null) {
            notFound()
            return
        }

        prescriptionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Prescription.label', default: 'Prescription'), prescriptionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prescription.label', default: 'Prescription'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
