package pg.tm470.boltfund.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Route {

    @Size(max = 25)
    private String name;

    @Size(max = 2000)
    private String description;

    @Size(max = 1000)
    private String note;

    private Integer length;

    private Integer bolts;

    @NotNull
    @Past
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dateCreated;

    @NotNull
    @Value("#{new java.util.Date()}")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dateSubmitted;

    @Past
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dateRebolted;

    @ManyToOne
    private Rating rating;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Style> style = new HashSet<Style>();

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Grade> grade = new HashSet<Grade>();

    @ManyToOne
    private Sector sector;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "routesBolted")
    private Set<Bolter> boltedBy = new HashSet<Bolter>();

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "routesRebolted")
    private Set<Bolter> reboltedBy = new HashSet<Bolter>();

    public static List<pg.tm470.boltfund.domain.Route> findByExampleLike(pg.tm470.boltfund.domain.Route c, int firstResult, int maxResults, String sortColumn, String sortDir) {
        EntityManager em = Route.entityManager();
        Session session = (Session) em.getDelegate();
        Example example = Example.create(c).ignoreCase().enableLike(MatchMode.ANYWHERE);
        Criteria criteria = session.createCriteria(Route.class).add(example).setFirstResult(firstResult).setMaxResults(maxResults).addOrder("desc".equals(sortDir) ? Order.desc(sortColumn) : Order.asc(sortColumn));
        return criteria.list();
    }

    public static long countByExampleLike(pg.tm470.boltfund.domain.Route c) {
        EntityManager em = Route.entityManager();
        Session session = (Session) em.getDelegate();
        Example example = Example.create(c).ignoreCase().enableLike(MatchMode.ANYWHERE);
        Criteria criteria = session.createCriteria(Route.class).add(example).setProjection(Projections.rowCount());
        return (Long) criteria.uniqueResult();
    }
}