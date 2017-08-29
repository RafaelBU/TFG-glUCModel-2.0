package util;

import jcolibri.casebase.LinealCaseBase;
import jcolibri.cbraplications.StandardCBRApplication;
import jcolibri.cbrcore.Attribute;
import jcolibri.cbrcore.CBRCase;
import jcolibri.cbrcore.CBRCaseBase;
import jcolibri.cbrcore.CBRQuery;
import jcolibri.cbrcore.Connector;
import jcolibri.connector.DataBaseConnector;
import jcolibri.exception.ExecutionException;
import jcolibri.method.retrieve.RetrievalResult;
import jcolibri.method.retrieve.NNretrieval.NNConfig;
import jcolibri.method.retrieve.NNretrieval.NNScoringMethod;
import jcolibri.method.retrieve.NNretrieval.similarity.global.Average;
import jcolibri.method.retrieve.NNretrieval.similarity.local.Interval;

import java.util.Collection;

import beans.Descripcionrec;
import beans.Mediciones;

public class Recomendador implements StandardCBRApplication {

	 /** Connector object */
    Connector _connector;
    /** CaseBase object */
    CBRCaseBase _caseBase;

    /** KNN config */
    NNConfig simConfig;
    
	@Override
	public void configure() throws ExecutionException {
		// Create a data base connector
		_connector = new DataBaseConnector();
		// Init the ddbb connector with the config file
		_connector.initFromXMLfile(jcolibri.util.FileIO
						.findFile("databaseconfig.xml"));
		// Create a Lineal case base for in-memory organization
		_caseBase = new LinealCaseBase();
				
		simConfig = new NNConfig();
		// Set the average() global similarity function for the description of the case
		simConfig.setDescriptionSimFunction(new Average());
				
		simConfig.addMapping(new Attribute("adehiper", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("adehipo", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("ddhiper", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("ddhipo", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("mmhiper", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("mmhipo", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("dcohiper", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("dcohipo", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("mhiper", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("mhipo", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("dcehiper", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("dcehipo", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("adohiper", Descripcionrec.class), new Interval(10));
		simConfig.addMapping(new Attribute("adohipo", Descripcionrec.class), new Interval(10));
				
				
		
	}

	@Override
	public CBRCaseBase preCycle() throws ExecutionException {
		// Load cases from connector into the case base
		_caseBase.init(_connector);		
		// Print the cases
		java.util.Collection<CBRCase> cases = _caseBase.getCases();
		for(CBRCase c: cases)
			System.out.println(c);
		
		return _caseBase;
	}
	
	@Override
	public void cycle(CBRQuery query) throws ExecutionException {
		// Execute KNN
		Collection<RetrievalResult> eval = NNScoringMethod.evaluateSimilarity(_caseBase.getCases(), query, simConfig);
		
		System.out.println("Query Description:");
		System.out.println(query.getDescription());
		System.out.println();
		
		// Print the retrieval
		System.out.println("Retrieved cases:");
		for(RetrievalResult nse: eval){
			//Si el valor despues de la función de similitud es mayor o igual que 0.5 
			//sera una recomendacion automática para el paciente
			if(nse.getEval() >= 0.5 && nse.getEval() < 1)
				System.out.println("Recomendación valida");
			else
				System.out.println("Recomendación no válida");
			System.out.println(nse);
		}
		
	}

	@Override
	public void postCycle() throws ExecutionException {
		this._caseBase.close();
		
	}
	
	public void getListaRecomendacionesAutomaticas(Mediciones medicion){
		
		StandardCBRApplication recomendador = new Recomendador();
		
		try
		{
		    recomendador.configure();
		    
		    recomendador.preCycle();
		    
		    CBRQuery query = new CBRQuery();
		    
		    query.setDescription(medicion);
		    
		    recomendador.cycle(query);
		    
		    recomendador.postCycle();
		    
		} catch (Exception e)
		{
		    org.apache.commons.logging.LogFactory.getLog(Recomendador.class).error(e);
			//e.printStackTrace();
		    
		}
	}

	

}
