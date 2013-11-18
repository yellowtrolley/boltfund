package pg.tm470.boltfund.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.joda.time.Interval;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import pg.tm470.boltfund.web.datatables.DataTablesRequest;
import pg.tm470.boltfund.web.datatables.ExcludeDatePropertiesSelector;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Crag {

    @Size(max = 20)
    private String name;

    @Size(max = 5000)
    private String description;

    @Size(max = 2000)
    private String notes;

    @Size(max = 5000)
    private String access;

    @Size(max = 20)
    private String rockType;

    private Integer height;

    @ManyToOne
    private Rating rating;

    @Transient
    private Set<Season> season = new HashSet<Season>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<PrintedGuide> guides = new HashSet<PrintedGuide>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Infos> infos = new HashSet<Infos>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "crag")
    private Set<Sector> sectors = new HashSet<Sector>();
    
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Bolter> editors = new HashSet<Bolter>();

    @ManyToOne
    private Location location;

    public String getAddress() {
    	return getLocation() != null && getLocation().getAddress() != null ? getLocation().getAddress() : ""; 
    }
    
    public void setAddress(String address) {
    	Location loc = getLocation() == null ? new Location() : getLocation();
    	loc.setAddress(address);
    }
    
    /* Attention. Example does not include associations or ids.
     * A way around is:
     * if(e.getRating() != null) {
    		criteria.createCriteria("rating")
    		.add(Example.create(e.getRating()));
        }*/
    public static List<Crag> findByExampleLike(DataTablesRequest<Crag> dataTablesRequest) {
        EntityManager em = Crag.entityManager();
        Session session = (Session) em.getDelegate();
        Crag e = dataTablesRequest.searchObj;
        Example example = Example.create(e).enableLike(MatchMode.ANYWHERE).ignoreCase().setPropertySelector(new ExcludeDatePropertiesSelector());
        Criteria criteria = session.createCriteria(Crag.class).add(example);
        
        if(e.getLocation() != null) {
    		criteria.createCriteria("location")
    		.add(Example.create(e.getLocation()));
        }
        
        int firstResult = dataTablesRequest.iDisplayStart; 
        int maxResults = dataTablesRequest.iDisplayLength; 
        String sortColumn = dataTablesRequest.amDataProp.get(dataTablesRequest.aiSortCol.get(0)); // != null ? dataTablesRequest.amDataProp.get(dataTablesRequest.aiSortCol.get(0)) : dataTablesRequest.amDataProp.get(1) 
        String sortDir = dataTablesRequest.asSortDir.get(0);
        Map<String,Interval> msIntervals = dataTablesRequest.msIntervals;
        
        if(msIntervals != null && !msIntervals.isEmpty()) {
        	addDateIntervalCriterion(criteria,msIntervals);
        }
        
        criteria.setFirstResult(firstResult)
        		.setMaxResults(maxResults)
        		.addOrder("desc".equals(sortDir) ? Order.desc(sortColumn) : Order.asc(sortColumn));
        
        return criteria.list();
    }

    public static long countByExampleLike(DataTablesRequest<Crag> dataTablesRequest) {
    	EntityManager em = Crag.entityManager();
        Session session = (Session) em.getDelegate();
        Crag e = dataTablesRequest.searchObj;
        Example example = Example.create(e).enableLike(MatchMode.ANYWHERE).ignoreCase().setPropertySelector(new ExcludeDatePropertiesSelector());
        Criteria criteria = session.createCriteria(Crag.class).add(example);
        Map<String,Interval> msIntervals = dataTablesRequest.msIntervals;
        
        if(msIntervals != null && !msIntervals.isEmpty()) {
        	addDateIntervalCriterion(criteria,msIntervals);
        }
        
        criteria.setProjection(Projections.rowCount());
        
        return (Long) criteria.uniqueResult();
    }
    
    private static void addDateIntervalCriterion(Criteria criteria, Map<String,Interval> msIntervals) {
    	for(Map.Entry<String, Interval> e : msIntervals.entrySet()) {
    		String propertyName = e.getKey();
    		Interval interval = e.getValue();
    		if(interval.getStartMillis() != Long.MIN_VALUE) {
    			criteria.add(Restrictions.ge(propertyName, new Date(interval.getStartMillis())));
    		}
    		if(interval.getEndMillis() != Long.MAX_VALUE) {
    			criteria.add(Restrictions.le(propertyName, new Date(interval.getEndMillis())));
    		}
    	}
    }
}
