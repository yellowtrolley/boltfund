package pg.tm470.boltfund.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pg.tm470.boltfund.domain.Style;

@RooWebJson(jsonObject = Style.class)
@Controller
@RequestMapping("/styles")
@RooWebScaffold(path = "styles", formBackingObject = Style.class)
public class StyleController {
}
