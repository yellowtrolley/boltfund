package pg.tm470.boltfund.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pg.tm470.boltfund.domain.PriceRange;

@RooWebJson(jsonObject = PriceRange.class)
@Controller
@RequestMapping("/priceranges")
@RooWebScaffold(path = "priceranges", formBackingObject = PriceRange.class)
public class PriceRangeController {
}
