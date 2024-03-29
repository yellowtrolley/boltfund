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
import pg.tm470.boltfund.domain.Style;
import pg.tm470.boltfund.web.StyleController;

privileged aspect StyleController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String StyleController.create(@Valid Style style, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, style);
            return "styles/create";
        }
        uiModel.asMap().clear();
        style.persist();
        return "redirect:/styles/" + encodeUrlPathSegment(style.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String StyleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Style());
        return "styles/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StyleController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("style", Style.findStyle(id));
        uiModel.addAttribute("itemId", id);
        return "styles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StyleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("styles", Style.findStyleEntries(firstResult, sizeNo));
            float nrOfPages = (float) Style.countStyles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("styles", Style.findAllStyles());
        }
        return "styles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String StyleController.update(@Valid Style style, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, style);
            return "styles/update";
        }
        uiModel.asMap().clear();
        style.merge();
        return "redirect:/styles/" + encodeUrlPathSegment(style.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String StyleController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Style.findStyle(id));
        return "styles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StyleController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Style style = Style.findStyle(id);
        style.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/styles";
    }
    
    void StyleController.populateEditForm(Model uiModel, Style style) {
        uiModel.addAttribute("style", style);
    }
    
    String StyleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
