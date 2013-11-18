package pg.tm470.boltfund.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pg.tm470.boltfund.domain.Crag;
import pg.tm470.boltfund.domain.Route;
import pg.tm470.boltfund.domain.Season;
import pg.tm470.boltfund.domain.Sector;
import pg.tm470.boltfund.web.datatables.DataTablesRequest;
import pg.tm470.boltfund.web.datatables.DataTablesResponse;
import pg.tm470.boltfund.web.datatables.IntervalFactory;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import flexjson.transformer.DateTransformer;

@RooWebJson(jsonObject = Crag.class)
@Controller
@RequestMapping("/crags")
@RooWebScaffold(path = "crags", formBackingObject = Crag.class)
public class CragController {
	@Autowired MessageSource messageSource;
	/*
	 *  sEcho=1&
	    iColumns=3
	    sColumns=&
	    iDisplayStart=0&
	    iDisplayLength=10&
	    mDataProp_0=0&
	    mDataProp_1=1&
	    mDataProp_2=2&
	    sSearch=&
	    bRegex=false&
	    sSearch_0=&
	    bRegex_0=false&
	    bSearchable_0=true&
	    sSearch_1=&
	    bRegex_1=false&
	    bSearchable_1=true&
	    sSearch_2=&
	    bRegex_2=false&
	    bSearchable_2=true&
	    iSortCol_0=0&
	    sSortDir_0=asc&
	    iSortingCols=1&
	    bSortable_0=true&
	    bSortable_1=true&
	    bSortable_2=true&
	 */
	@RequestMapping(params = "data", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> data(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        
        List<Crag> data = new ArrayList<Crag>();
        DataTablesRequest<Crag> dataTablesRequest = new JSONDeserializer<DataTablesRequest<Crag>>()
        		.use("msIntervals", new IntervalFactory("dd/MM/yyyy"))
        		.use(Date.class, new DateTransformer("dd/MM/yyyy") ) // TODO Manage Timestamp
        		.use("searchObj", Crag.class)
        		.use(null, DataTablesRequest.class)
        		.deserialize(json);

        data = Crag.findByExampleLike(dataTablesRequest);
        Long totalRecords = Crag.countByExampleLike(dataTablesRequest);
        
        DataTablesResponse<Crag> result = new DataTablesResponse<Crag>(""+dataTablesRequest.sEcho, 
        		totalRecords.intValue(), 
        		totalRecords.intValue(), 
        		data, 
        		dataTablesRequest.sColumns);
        
        try{
        	return new ResponseEntity<String>(new JSONSerializer().exclude("*.class").deepSerialize(result), headers, HttpStatus.OK);
//	.exclude("*.otherProperty","*.anotherOne",)
        	
        } catch (Exception ex) {
        	ex.printStackTrace();
        	return new ResponseEntity<String>(ex.getMessage(), headers, HttpStatus.OK);
        }
    	
    }
	
	@RequestMapping(params = "data", value = "/{id}/sectors", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> sectorsList(@PathVariable("id") Long id, @RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        
        List<Sector> data = new ArrayList<Sector>();

        DataTablesRequest<Sector> dataTablesRequest = new JSONDeserializer<DataTablesRequest<Sector>>()
        		.use(Date.class, new DateTransformer("dd/MM/yyyy") ) // TODO Manage Timestamp
        		.use(null, Route.class)
        		.use("searchObj", Sector.class)
        		.use(null, DataTablesRequest.class)
        		.deserialize(json);
        
        dataTablesRequest.searchObj.setCrag(Crag.findCrag(id));
        data = Sector.findByExampleLike(dataTablesRequest.searchObj, // TODO NO FUNCIONA ???
        		dataTablesRequest.iDisplayStart, 
        		dataTablesRequest.iDisplayLength, 
        		dataTablesRequest.amDataProp.get(dataTablesRequest.aiSortCol.get(0)), 
        		dataTablesRequest.asSortDir.get(0));

        Long totalRecords = Sector.countByExampleLike(dataTablesRequest.searchObj);

        DataTablesResponse<Sector> result = new DataTablesResponse<Sector>(""+dataTablesRequest.sEcho, 
        		totalRecords.intValue(), 
        		totalRecords.intValue(), 
        		data, 
        		dataTablesRequest.sColumns);
    	
    	return new ResponseEntity<String>(new JSONSerializer().exclude("*.class").deepSerialize(result), headers, HttpStatus.OK);
    }

	@RequestMapping(params = "data", value = "/sectors/{id}/routes", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> routesList(@PathVariable("id") String idStr, @RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        
        List<Route> data;
        Long totalRecords;

        DataTablesRequest<Route> dataTablesRequest = new JSONDeserializer<DataTablesRequest<Route>>()
        		.use(Date.class, new DateTransformer("dd/MM/yyyy") ) // TODO Manage Timestamp
        		.use("searchObj", Route.class)
        		.use(null, DataTablesRequest.class)
        		.deserialize(json);

        try {
        	Long id = new Long(idStr);
        	dataTablesRequest.searchObj.setSector(Sector.findSector(id));
        	data = Route.findByExampleLike(dataTablesRequest.searchObj, 
        			dataTablesRequest.iDisplayStart, 
        			dataTablesRequest.iDisplayLength, 
        			dataTablesRequest.amDataProp.get(dataTablesRequest.aiSortCol.get(0)), 
        			dataTablesRequest.asSortDir.get(0));
        	
        	totalRecords = Route.countByExampleLike(dataTablesRequest.searchObj);
        } catch (Exception e) {
        	totalRecords = new Long(0);
        	data = new ArrayList<Route>();
        }        
        

        DataTablesResponse<Route> result = new DataTablesResponse<Route>(""+dataTablesRequest.sEcho, 
        		totalRecords.intValue(), 
        		totalRecords.intValue(), 
        		data, 
        		dataTablesRequest.sColumns);
    	
    	return new ResponseEntity<String>(new JSONSerializer().exclude("*.class").deepSerialize(result), headers, HttpStatus.OK);
    }
	
	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
		populateEditForm(uiModel, new Crag());
		uiModel.addAttribute("seasons", getSeasons());
        return "crags/create";
    }

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Crag crag, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, crag);
            uiModel.addAttribute("seasons", getSeasons());
            return "crags/create";
        }
        uiModel.asMap().clear();
        crag.persist();
        return "redirect:/crags/" + encodeUrlPathSegment(crag.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Crag.findCrag(id));
        return "crags/update";
    }
	
	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Crag crag, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, crag);
            return "crags/update";
        }
        uiModel.asMap().clear();
        crag.merge();
        return "redirect:/crags/" + encodeUrlPathSegment(crag.getId().toString(), httpServletRequest);
    }
	

	void populateEditForm(Model uiModel, Crag crag) {
        uiModel.addAttribute("crag", crag);
//        uiModel.addAttribute("infoses", crag.getInfos());
//        uiModel.addAttribute("printedguides", crag.getGuides());
//        uiModel.addAttribute("rankings", crag.getRanking());
//        uiModel.addAttribute("seasons", crag.getSeason());
        
//        uiModel.addAttribute("sectors", Sector.findAllSectors());
        
        uiModel.addAttribute("sector", new Sector());
//        uiModel.addAttribute("infoses", Infos.findAllInfoses());
//        uiModel.addAttribute("printedguides", PrintedGuide.findAllPrintedGuides());
//        uiModel.addAttribute("rankings", Rating.findAllRankings());
//        uiModel.addAttribute("seasons", Season.findAllSeasons());
//        uiModel.addAttribute("sectors", Sector.findAllSectors());
//        uiModel.addAttribute("routes", Route.findAllRoutes());
        uiModel.addAttribute("route", new Route());
    }


	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("crag", Crag.findCrag(id));
        uiModel.addAttribute("itemId", id);
        return "crags/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        /*if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("crags", Crag.findCragEntries(firstResult, sizeNo));
            float nrOfPages = (float) Crag.countCrags() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("crags", Crag.findAllCrags());
        }*/
		uiModel.addAttribute("crags", new ArrayList<Crag>());
		uiModel.addAttribute("seasons", getSeasons());
        return "crags/list";
    }
	
	private List<String> getSeasons() {
		List<String> seasons = new ArrayList<String>();
		for(Season s : Season.values()) {
			messageSource.getMessage(s.getName(), null, LocaleContextHolder.getLocale());
			seasons.add(s.getName());
			
		}
		return seasons;
	}
}
