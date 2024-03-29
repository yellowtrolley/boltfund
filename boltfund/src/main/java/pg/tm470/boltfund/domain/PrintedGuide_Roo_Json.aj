// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import pg.tm470.boltfund.domain.PrintedGuide;

privileged aspect PrintedGuide_Roo_Json {
    
    public String PrintedGuide.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public String PrintedGuide.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static PrintedGuide PrintedGuide.fromJsonToPrintedGuide(String json) {
        return new JSONDeserializer<PrintedGuide>().use(null, PrintedGuide.class).deserialize(json);
    }
    
    public static String PrintedGuide.toJsonArray(Collection<PrintedGuide> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static String PrintedGuide.toJsonArray(Collection<PrintedGuide> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<PrintedGuide> PrintedGuide.fromJsonArrayToPrintedGuides(String json) {
        return new JSONDeserializer<List<PrintedGuide>>().use(null, ArrayList.class).use("values", PrintedGuide.class).deserialize(json);
    }
    
}
