// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;
import pg.tm470.boltfund.domain.PrintedGuide;
import pg.tm470.boltfund.domain.PrintedGuideDataOnDemand;

privileged aspect PrintedGuideDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PrintedGuideDataOnDemand: @Component;
    
    private Random PrintedGuideDataOnDemand.rnd = new SecureRandom();
    
    private List<PrintedGuide> PrintedGuideDataOnDemand.data;
    
    public PrintedGuide PrintedGuideDataOnDemand.getNewTransientPrintedGuide(int index) {
        PrintedGuide obj = new PrintedGuide();
        setDescription(obj, index);
        setLink(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void PrintedGuideDataOnDemand.setDescription(PrintedGuide obj, int index) {
        String description = "description_" + index;
        if (description.length() > 2000) {
            description = description.substring(0, 2000);
        }
        obj.setDescription(description);
    }
    
    public void PrintedGuideDataOnDemand.setLink(PrintedGuide obj, int index) {
        String link = "link_" + index;
        if (link.length() > 100) {
            link = link.substring(0, 100);
        }
        obj.setLink(link);
    }
    
    public void PrintedGuideDataOnDemand.setName(PrintedGuide obj, int index) {
        String name = "name_" + index;
        if (name.length() > 25) {
            name = name.substring(0, 25);
        }
        obj.setName(name);
    }
    
    public PrintedGuide PrintedGuideDataOnDemand.getSpecificPrintedGuide(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PrintedGuide obj = data.get(index);
        Long id = obj.getId();
        return PrintedGuide.findPrintedGuide(id);
    }
    
    public PrintedGuide PrintedGuideDataOnDemand.getRandomPrintedGuide() {
        init();
        PrintedGuide obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return PrintedGuide.findPrintedGuide(id);
    }
    
    public boolean PrintedGuideDataOnDemand.modifyPrintedGuide(PrintedGuide obj) {
        return false;
    }
    
    public void PrintedGuideDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = PrintedGuide.findPrintedGuideEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PrintedGuide' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PrintedGuide>();
        for (int i = 0; i < 10; i++) {
            PrintedGuide obj = getNewTransientPrintedGuide(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}