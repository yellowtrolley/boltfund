// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import pg.tm470.boltfund.domain.Eat;

privileged aspect Eat_Roo_Json {
    
    public String Eat.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public String Eat.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Eat Eat.fromJsonToEat(String json) {
        return new JSONDeserializer<Eat>().use(null, Eat.class).deserialize(json);
    }
    
    public static String Eat.toJsonArray(Collection<Eat> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static String Eat.toJsonArray(Collection<Eat> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Eat> Eat.fromJsonArrayToEats(String json) {
        return new JSONDeserializer<List<Eat>>().use(null, ArrayList.class).use("values", Eat.class).deserialize(json);
    }
    
}
