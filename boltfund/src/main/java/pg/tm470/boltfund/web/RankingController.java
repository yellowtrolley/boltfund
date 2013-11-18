package pg.tm470.boltfund.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pg.tm470.boltfund.domain.Rating;

@RooWebJson(jsonObject = Rating.class)
@Controller
@RequestMapping("/rankings")
@RooWebScaffold(path = "rankings", formBackingObject = Rating.class)
public class RankingController {
}
