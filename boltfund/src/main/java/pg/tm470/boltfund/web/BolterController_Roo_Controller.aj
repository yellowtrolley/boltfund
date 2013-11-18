// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.web;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
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
import pg.tm470.boltfund.domain.AppRole;
import pg.tm470.boltfund.domain.Bolter;
import pg.tm470.boltfund.domain.Route;
import pg.tm470.boltfund.web.BolterController;

privileged aspect BolterController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BolterController.create(@Valid Bolter bolter, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, bolter);
            return "bolters/create";
        }
        uiModel.asMap().clear();
        bolter.persist();
        return "redirect:/bolters/" + encodeUrlPathSegment(bolter.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BolterController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Bolter());
        return "bolters/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BolterController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("bolter", Bolter.findBolter(id));
        uiModel.addAttribute("itemId", id);
        return "bolters/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BolterController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("bolters", Bolter.findBolterEntries(firstResult, sizeNo));
            float nrOfPages = (float) Bolter.countBolters() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("bolters", Bolter.findAllBolters());
        }
        return "bolters/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BolterController.update(@Valid Bolter bolter, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, bolter);
            return "bolters/update";
        }
        uiModel.asMap().clear();
        bolter.merge();
        return "redirect:/bolters/" + encodeUrlPathSegment(bolter.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BolterController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Bolter.findBolter(id));
        return "bolters/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BolterController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Bolter bolter = Bolter.findBolter(id);
        bolter.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/bolters";
    }
    
    void BolterController.populateEditForm(Model uiModel, Bolter bolter) {
        uiModel.addAttribute("bolter", bolter);
        uiModel.addAttribute("approles", Arrays.asList(AppRole.values()));
        uiModel.addAttribute("routes", Route.findAllRoutes());
    }
    
    String BolterController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
