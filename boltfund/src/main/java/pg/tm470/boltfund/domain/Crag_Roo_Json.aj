// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import pg.tm470.boltfund.domain.Crag;

privileged aspect Crag_Roo_Json {
    
    public String Crag.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public String Crag.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Crag Crag.fromJsonToCrag(String json) {
        return new JSONDeserializer<Crag>().use(null, Crag.class).deserialize(json);
    }
    
    public static String Crag.toJsonArray(Collection<Crag> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static String Crag.toJsonArray(Collection<Crag> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Crag> Crag.fromJsonArrayToCrags(String json) {
        return new JSONDeserializer<List<Crag>>().use(null, ArrayList.class).use("values", Crag.class).deserialize(json);
    }
    
}
