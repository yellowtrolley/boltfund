// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import pg.tm470.boltfund.domain.Location;
import pg.tm470.boltfund.domain.PriceRange;
import pg.tm470.boltfund.domain.Rating;
import pg.tm470.boltfund.domain.Sleep;
import pg.tm470.boltfund.web.SleepController;

privileged aspect SleepController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SleepController.create(@Valid Sleep sleep, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sleep);
            return "sleeps/create";
        }
        uiModel.asMap().clear();
        sleep.persist();
        return "redirect:/sleeps/" + encodeUrlPathSegment(sleep.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SleepController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Sleep());
        return "sleeps/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SleepController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("sleep", Sleep.findSleep(id));
        uiModel.addAttribute("itemId", id);
        return "sleeps/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SleepController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sleeps", Sleep.findSleepEntries(firstResult, sizeNo));
            float nrOfPages = (float) Sleep.countSleeps() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sleeps", Sleep.findAllSleeps());
        }
        return "sleeps/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SleepController.update(@Valid Sleep sleep, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sleep);
            return "sleeps/update";
        }
        uiModel.asMap().clear();
        sleep.merge();
        return "redirect:/sleeps/" + encodeUrlPathSegment(sleep.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SleepController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Sleep.findSleep(id));
        return "sleeps/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SleepController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Sleep sleep = Sleep.findSleep(id);
        sleep.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sleeps";
    }
    
    void SleepController.populateEditForm(Model uiModel, Sleep sleep) {
        uiModel.addAttribute("sleep", sleep);
        uiModel.addAttribute("locations", Location.findAllLocations());
        uiModel.addAttribute("priceranges", PriceRange.findAllPriceRanges());
        uiModel.addAttribute("ratings", Rating.findAllRatings());
    }
    
    String SleepController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}