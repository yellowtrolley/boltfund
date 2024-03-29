// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import pg.tm470.boltfund.domain.Rating;
import pg.tm470.boltfund.domain.RatingDataOnDemand;
import pg.tm470.boltfund.domain.RatingIntegrationTest;

privileged aspect RatingIntegrationTest_Roo_IntegrationTest {
    
    declare @type: RatingIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: RatingIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: RatingIntegrationTest: @Transactional;
    
    @Autowired
    RatingDataOnDemand RatingIntegrationTest.dod;
    
    @Test
    public void RatingIntegrationTest.testCountRatings() {
        Assert.assertNotNull("Data on demand for 'Rating' failed to initialize correctly", dod.getRandomRating());
        long count = Rating.countRatings();
        Assert.assertTrue("Counter for 'Rating' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void RatingIntegrationTest.testFindRating() {
        Rating obj = dod.getRandomRating();
        Assert.assertNotNull("Data on demand for 'Rating' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Rating' failed to provide an identifier", id);
        obj = Rating.findRating(id);
        Assert.assertNotNull("Find method for 'Rating' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Rating' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void RatingIntegrationTest.testFindAllRatings() {
        Assert.assertNotNull("Data on demand for 'Rating' failed to initialize correctly", dod.getRandomRating());
        long count = Rating.countRatings();
        Assert.assertTrue("Too expensive to perform a find all test for 'Rating', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Rating> result = Rating.findAllRatings();
        Assert.assertNotNull("Find all method for 'Rating' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Rating' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void RatingIntegrationTest.testFindRatingEntries() {
        Assert.assertNotNull("Data on demand for 'Rating' failed to initialize correctly", dod.getRandomRating());
        long count = Rating.countRatings();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Rating> result = Rating.findRatingEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Rating' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Rating' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void RatingIntegrationTest.testFlush() {
        Rating obj = dod.getRandomRating();
        Assert.assertNotNull("Data on demand for 'Rating' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Rating' failed to provide an identifier", id);
        obj = Rating.findRating(id);
        Assert.assertNotNull("Find method for 'Rating' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyRating(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Rating' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void RatingIntegrationTest.testMergeUpdate() {
        Rating obj = dod.getRandomRating();
        Assert.assertNotNull("Data on demand for 'Rating' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Rating' failed to provide an identifier", id);
        obj = Rating.findRating(id);
        boolean modified =  dod.modifyRating(obj);
        Integer currentVersion = obj.getVersion();
        Rating merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Rating' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void RatingIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Rating' failed to initialize correctly", dod.getRandomRating());
        Rating obj = dod.getNewTransientRating(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Rating' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Rating' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Rating' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void RatingIntegrationTest.testRemove() {
        Rating obj = dod.getRandomRating();
        Assert.assertNotNull("Data on demand for 'Rating' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Rating' failed to provide an identifier", id);
        obj = Rating.findRating(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Rating' with identifier '" + id + "'", Rating.findRating(id));
    }
    
}
