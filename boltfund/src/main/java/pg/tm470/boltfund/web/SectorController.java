package pg.tm470.boltfund.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pg.tm470.boltfund.domain.Sector;

@RooWebJson(jsonObject = Sector.class)
@Controller
@RequestMapping("/sectors")
@RooWebScaffold(path = "sectors", formBackingObject = Sector.class)
public class SectorController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Sector sector, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sector);
            return "redirect:/crags?form";
        }
        uiModel.asMap().clear();
        sector.persist();
        return "redirect:/crags?form" + encodeUrlPathSegment(sector.getId().toString(), httpServletRequest);
    }
}
