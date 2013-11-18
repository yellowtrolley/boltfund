// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import pg.tm470.boltfund.domain.Sleep;

privileged aspect Sleep_Roo_Json {
    
    public String Sleep.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public String Sleep.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Sleep Sleep.fromJsonToSleep(String json) {
        return new JSONDeserializer<Sleep>().use(null, Sleep.class).deserialize(json);
    }
    
    public static String Sleep.toJsonArray(Collection<Sleep> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static String Sleep.toJsonArray(Collection<Sleep> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Sleep> Sleep.fromJsonArrayToSleeps(String json) {
        return new JSONDeserializer<List<Sleep>>().use(null, ArrayList.class).use("values", Sleep.class).deserialize(json);
    }
    
}
