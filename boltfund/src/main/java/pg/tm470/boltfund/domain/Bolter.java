package pg.tm470.boltfund.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Bolter extends AbstractUser {

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Route> routesBolted = new HashSet<Route>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Route> routesRebolted = new HashSet<Route>();
}
