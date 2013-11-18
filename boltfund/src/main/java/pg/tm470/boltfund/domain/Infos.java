package pg.tm470.boltfund.domain;

import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "TABLE_PER_CLASS")
@RooJson(deepSerialize = true)
public abstract class Infos {

    @Size(max = 30)
    private String name;

    @Size(max = 30)
    private String contact;

    @Size(max = 50)
    private String email;

    @Size(max = 25)
    private String phone;

    @Size(max = 25)
    private String mobile;

    @Size(max = 25)
    private String fax;

    @Size(max = 5000)
    private String access;

    @Size(max = 1000)
    private String note;

    @Size(max = 100)
    private String link;

    @ManyToOne
    private Location location;
}
