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
import pg.tm470.boltfund.domain.Rating;
import pg.tm470.boltfund.web.RankingController;

privileged aspect RankingController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RankingController.create(@Valid Rating rating, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, rating);
            return "rankings/create";
        }
        uiModel.asMap().clear();
        rating.persist();
        return "redirect:/rankings/" + encodeUrlPathSegment(rating.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RankingController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Rating());
        return "rankings/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RankingController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("rating", Rating.findRating(id));
        uiModel.addAttribute("itemId", id);
        return "rankings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RankingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ratings", Rating.findRatingEntries(firstResult, sizeNo));
            float nrOfPages = (float) Rating.countRatings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ratings", Rating.findAllRatings());
        }
        return "rankings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RankingController.update(@Valid Rating rating, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, rating);
            return "rankings/update";
        }
        uiModel.asMap().clear();
        rating.merge();
        return "redirect:/rankings/" + encodeUrlPathSegment(rating.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RankingController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Rating.findRating(id));
        return "rankings/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RankingController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Rating rating = Rating.findRating(id);
        rating.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/rankings";
    }
    
    void RankingController.populateEditForm(Model uiModel, Rating rating) {
        uiModel.addAttribute("rating", rating);
    }
    
    String RankingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
