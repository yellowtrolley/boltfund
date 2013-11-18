package pg.tm470.boltfund.web.datatables;

import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.joda.time.Interval;

import flexjson.JSONException;
import flexjson.ObjectBinder;
import flexjson.ObjectFactory;

public class IntervalFactory implements ObjectFactory {

	SimpleDateFormat simpleDateFormatter;
	
	public IntervalFactory(String dateFormat) {
		simpleDateFormatter = new SimpleDateFormat(dateFormat);
	}

	@SuppressWarnings("rawtypes")
	public Object instantiate(ObjectBinder context, Object value, Type targetType, Class targetClass) {
        try {
        	@SuppressWarnings("unchecked")
			Map<String,Map<String, String>> map = (Map<String, Map<String, String>>) value;
        	Map<String, Interval> ret = new HashMap<String, Interval>();
        	
        	for(Map.Entry<String, Map<String,String>> e : map.entrySet()) {
        		String property = e.getKey();
        		String startStr = e.getValue().get("start");
        		String endStr = e.getValue().get("end");
        		Date startDate, endDate; 
        		startDate = startStr.isEmpty()?null:simpleDateFormatter.parse(startStr);
        		endDate = endStr.isEmpty()?null:simpleDateFormatter.parse(endStr);
        		long startTime = startDate != null ? startDate.getTime() : Long.MIN_VALUE;
        		long endTime = endDate != null ? endDate.getTime() : Long.MAX_VALUE;
        		ret.put(property, new Interval(startTime, endTime));
        	}
        	
        	return ret;
        } catch (ParseException e) {
            throw new JSONException(String.format( "Failed to parse %s with %s pattern.", value, simpleDateFormatter.toPattern() ), e );
        }
    }

}
