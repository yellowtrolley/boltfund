package pg.tm470.boltfund.domain;

import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class PrintedGuide {

    @Size(max = 25)
    private String name;

    @Size(max = 2000)
    private String description;

    @Size(max = 100)
    private String link;
}
