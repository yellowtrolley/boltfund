// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.web;

import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pg.tm470.boltfund.domain.PrintedGuide;
import pg.tm470.boltfund.web.PrintedGuideController;

privileged aspect PrintedGuideController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PrintedGuideController.showJson(@PathVariable("id") Long id) {
        PrintedGuide printedGuide = PrintedGuide.findPrintedGuide(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (printedGuide == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(printedGuide.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PrintedGuideController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<PrintedGuide> result = PrintedGuide.findAllPrintedGuides();
        return new ResponseEntity<String>(PrintedGuide.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PrintedGuideController.createFromJson(@RequestBody String json) {
        PrintedGuide printedGuide = PrintedGuide.fromJsonToPrintedGuide(json);
        printedGuide.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PrintedGuideController.createFromJsonArray(@RequestBody String json) {
        for (PrintedGuide printedGuide: PrintedGuide.fromJsonArrayToPrintedGuides(json)) {
            printedGuide.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PrintedGuideController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        PrintedGuide printedGuide = PrintedGuide.fromJsonToPrintedGuide(json);
        if (printedGuide.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> PrintedGuideController.deleteFromJson(@PathVariable("id") Long id) {
        PrintedGuide printedGuide = PrintedGuide.findPrintedGuide(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (printedGuide == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        printedGuide.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}