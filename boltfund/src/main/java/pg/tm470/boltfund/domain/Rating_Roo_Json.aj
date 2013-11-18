// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import pg.tm470.boltfund.domain.Rating;

privileged aspect Rating_Roo_Json {
    
    public String Rating.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public String Rating.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Rating Rating.fromJsonToRating(String json) {
        return new JSONDeserializer<Rating>().use(null, Rating.class).deserialize(json);
    }
    
    public static String Rating.toJsonArray(Collection<Rating> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static String Rating.toJsonArray(Collection<Rating> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Rating> Rating.fromJsonArrayToRatings(String json) {
        return new JSONDeserializer<List<Rating>>().use(null, ArrayList.class).use("values", Rating.class).deserialize(json);
    }
    
}
