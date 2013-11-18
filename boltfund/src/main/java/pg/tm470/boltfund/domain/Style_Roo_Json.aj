// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import pg.tm470.boltfund.domain.Style;

privileged aspect Style_Roo_Json {
    
    public String Style.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public String Style.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Style Style.fromJsonToStyle(String json) {
        return new JSONDeserializer<Style>().use(null, Style.class).deserialize(json);
    }
    
    public static String Style.toJsonArray(Collection<Style> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static String Style.toJsonArray(Collection<Style> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Style> Style.fromJsonArrayToStyles(String json) {
        return new JSONDeserializer<List<Style>>().use(null, ArrayList.class).use("values", Style.class).deserialize(json);
    }
    
}
