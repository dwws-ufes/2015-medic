package br.ufes.inf.nemo.dwws.services


import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.query.QueryExecution;

import grails.transaction.Transactional

@Transactional
class PrescriptionService
{
    def listDeseases() 
	{
		def list = []
		String query = "";
		query += "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 									";
		query += "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 											";
		query += "PREFIX db: <http://bio2rdf.org/drugbank_vocabulary:> 											";
		query += "PREFIX dcterms: <http://purl.org/dc/terms/> 													";
		query += "PREFIX dbpedia-owl: <http://dbpedia.org/ontology/> 											";
		query += "SELECT distinct									 											";
		query += "		 ?disease									 											";
		query += "		 ?brand																					";
		query += "		 ?drug																					";
		query += "		 ?dosage																				";
		query += "		 ?indication																			";
		query += "		 ?brand_uri																				";
		query += "		 ?drug_uri																				";
		query += "		 ?dosage_uri																			";
		query += "		 ?indication_uri 																		";
		query += " WHERE 																						";
		query += " { 																							";
		query += "		?drug_uri a db:Drug . 																	";
		query += "		?drug_uri dcterms:title ?drug . 														";
		query += "		?drug_uri db:brand ?brand_uri . 														";
		query += "		?brand_uri dcterms:title ?brand . 														";
		query += "		?drug_uri db:dosage ?dosage_uri . 														";
		query += "		?dosage_uri dcterms:title ?dosage . 													";
		query += "		?drug_uri db:indication ?indication_uri . 												";
		query += "		?indication_uri dcterms:description ?indication . 										";
		query += "		SERVICE <http://dbpedia.org/sparql?default-graph-uri=http://dbpedia.org>  				";
		query += "		{ 																		 				";
		query += "			?disease_uri rdf:type dbpedia-owl:Disease .											";
		query += "			?disease_uri rdfs:label ?disease . 													";
		query += "			?disease_uri dcterms:subject ?category_uri .						 				";
		query += "			?dbp_drug_uri dcterms:subject ?category_uri .						 				";
		query += "			?dbp_drug_uri rdf:type dbpedia-owl:Drug .							 				";
		query += "			?dbp_drug_uri rdfs:label ?drug_name . 												";
		query += "			?dbp_drug_uri dbpedia-owl:drugbank ?drugbank_code . 								";
		query += "			FILTER(langMatches(lang(?disease), \"EN\")) . 										";
		query += "			FILTER(langMatches(lang(?drug_name), \"EN\")) . 									";
		query += "		}																						";
		query += "		FILTER (str(?drug_uri) = concat(\"http://bio2rdf.org/drugbank:\", ?drugbank_code)) . 	";
		query += " }																							";
		query += " ORDER BY ?disease ?brand	?drug																";
		
		QueryExecution queryExecution = QueryExecutionFactory.sparqlService("http://drugbank.bio2rdf.org/sparql", query);
		ResultSet resultSet = queryExecution.execSelect();
		while(resultSet.hasNext())
		{
			QuerySolution querySolution =  resultSet.next();
			
			list.add([disease:querySolution.getLiteral("disease").getString(),
						brand:querySolution.getLiteral("brand").getString(),
						 drug:querySolution.getLiteral("drug").getString(),
					   dosage:querySolution.getLiteral("dosage").getString(),
				   indication:querySolution.getLiteral("indication").getString()])
		}
		return list
    }
}
