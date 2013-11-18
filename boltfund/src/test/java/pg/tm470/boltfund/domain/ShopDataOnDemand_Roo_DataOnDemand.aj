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
import pg.tm470.boltfund.domain.Location;
import pg.tm470.boltfund.domain.Shop;
import pg.tm470.boltfund.domain.ShopDataOnDemand;

privileged aspect ShopDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ShopDataOnDemand: @Component;
    
    private Random ShopDataOnDemand.rnd = new SecureRandom();
    
    private List<Shop> ShopDataOnDemand.data;
    
    public Shop ShopDataOnDemand.getNewTransientShop(int index) {
        Shop obj = new Shop();
        setAccess(obj, index);
        setContact(obj, index);
        setEmail(obj, index);
        setFax(obj, index);
        setLink(obj, index);
        setLocation(obj, index);
        setMobile(obj, index);
        setName(obj, index);
        setNote(obj, index);
        setPhone(obj, index);
        return obj;
    }
    
    public void ShopDataOnDemand.setAccess(Shop obj, int index) {
        String access = "access_" + index;
        if (access.length() > 5000) {
            access = access.substring(0, 5000);
        }
        obj.setAccess(access);
    }
    
    public void ShopDataOnDemand.setContact(Shop obj, int index) {
        String contact = "contact_" + index;
        if (contact.length() > 30) {
            contact = contact.substring(0, 30);
        }
        obj.setContact(contact);
    }
    
    public void ShopDataOnDemand.setEmail(Shop obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 50) {
            email = email.substring(0, 50);
        }
        obj.setEmail(email);
    }
    
    public void ShopDataOnDemand.setFax(Shop obj, int index) {
        String fax = "fax_" + index;
        if (fax.length() > 25) {
            fax = fax.substring(0, 25);
        }
        obj.setFax(fax);
    }
    
    public void ShopDataOnDemand.setLink(Shop obj, int index) {
        String link = "link_" + index;
        if (link.length() > 100) {
            link = link.substring(0, 100);
        }
        obj.setLink(link);
    }
    
    public void ShopDataOnDemand.setLocation(Shop obj, int index) {
        Location location = null;
        obj.setLocation(location);
    }
    
    public void ShopDataOnDemand.setMobile(Shop obj, int index) {
        String mobile = "mobile_" + index;
        if (mobile.length() > 25) {
            mobile = mobile.substring(0, 25);
        }
        obj.setMobile(mobile);
    }
    
    public void ShopDataOnDemand.setName(Shop obj, int index) {
        String name = "name_" + index;
        if (name.length() > 30) {
            name = name.substring(0, 30);
        }
        obj.setName(name);
    }
    
    public void ShopDataOnDemand.setNote(Shop obj, int index) {
        String note = "note_" + index;
        if (note.length() > 1000) {
            note = note.substring(0, 1000);
        }
        obj.setNote(note);
    }
    
    public void ShopDataOnDemand.setPhone(Shop obj, int index) {
        String phone = "phone_" + index;
        if (phone.length() > 25) {
            phone = phone.substring(0, 25);
        }
        obj.setPhone(phone);
    }
    
    public Shop ShopDataOnDemand.getSpecificShop(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Shop obj = data.get(index);
        Long id = obj.getId();
        return Shop.findShop(id);
    }
    
    public Shop ShopDataOnDemand.getRandomShop() {
        init();
        Shop obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Shop.findShop(id);
    }
    
    public boolean ShopDataOnDemand.modifyShop(Shop obj) {
        return false;
    }
    
    public void ShopDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Shop.findShopEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Shop' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Shop>();
        for (int i = 0; i < 10; i++) {
            Shop obj = getNewTransientShop(i);
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
