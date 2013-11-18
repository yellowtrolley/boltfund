package pg.tm470.boltfund.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pg.tm470.boltfund.domain.Eat;

@RooWebJson(jsonObject = Eat.class)
@Controller
@RequestMapping("/eats")
@RooWebScaffold(path = "eats", formBackingObject = Eat.class)
public class EatController {
}
