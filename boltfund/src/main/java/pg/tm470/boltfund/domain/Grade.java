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
public class Grade {

    @Size(max = 5)
    private String yds;

    @Size(max = 5)
    private String britishTec;

    @Size(max = 5)
    private String britishAdj;

    @Size(max = 5)
    private String french;

    @Size(max = 5)
    private String uiaa;

    @Size(max = 5)
    private String saxon;

    @Size(max = 5)
    private String ewbank;

    @Size(max = 5)
    private String finnish;

    @Size(max = 5)
    private String norwegian;

    @Size(max = 5)
    private String brazilian;
}
