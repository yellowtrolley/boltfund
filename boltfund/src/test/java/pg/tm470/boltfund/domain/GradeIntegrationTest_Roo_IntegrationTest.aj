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
import pg.tm470.boltfund.domain.Grade;
import pg.tm470.boltfund.domain.GradeDataOnDemand;
import pg.tm470.boltfund.domain.GradeIntegrationTest;

privileged aspect GradeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: GradeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: GradeIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: GradeIntegrationTest: @Transactional;
    
    @Autowired
    GradeDataOnDemand GradeIntegrationTest.dod;
    
    @Test
    public void GradeIntegrationTest.testCountGrades() {
        Assert.assertNotNull("Data on demand for 'Grade' failed to initialize correctly", dod.getRandomGrade());
        long count = Grade.countGrades();
        Assert.assertTrue("Counter for 'Grade' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void GradeIntegrationTest.testFindGrade() {
        Grade obj = dod.getRandomGrade();
        Assert.assertNotNull("Data on demand for 'Grade' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Grade' failed to provide an identifier", id);
        obj = Grade.findGrade(id);
        Assert.assertNotNull("Find method for 'Grade' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Grade' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void GradeIntegrationTest.testFindAllGrades() {
        Assert.assertNotNull("Data on demand for 'Grade' failed to initialize correctly", dod.getRandomGrade());
        long count = Grade.countGrades();
        Assert.assertTrue("Too expensive to perform a find all test for 'Grade', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Grade> result = Grade.findAllGrades();
        Assert.assertNotNull("Find all method for 'Grade' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Grade' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void GradeIntegrationTest.testFindGradeEntries() {
        Assert.assertNotNull("Data on demand for 'Grade' failed to initialize correctly", dod.getRandomGrade());
        long count = Grade.countGrades();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Grade> result = Grade.findGradeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Grade' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Grade' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void GradeIntegrationTest.testFlush() {
        Grade obj = dod.getRandomGrade();
        Assert.assertNotNull("Data on demand for 'Grade' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Grade' failed to provide an identifier", id);
        obj = Grade.findGrade(id);
        Assert.assertNotNull("Find method for 'Grade' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyGrade(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Grade' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void GradeIntegrationTest.testMergeUpdate() {
        Grade obj = dod.getRandomGrade();
        Assert.assertNotNull("Data on demand for 'Grade' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Grade' failed to provide an identifier", id);
        obj = Grade.findGrade(id);
        boolean modified =  dod.modifyGrade(obj);
        Integer currentVersion = obj.getVersion();
        Grade merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Grade' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void GradeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Grade' failed to initialize correctly", dod.getRandomGrade());
        Grade obj = dod.getNewTransientGrade(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Grade' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Grade' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Grade' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void GradeIntegrationTest.testRemove() {
        Grade obj = dod.getRandomGrade();
        Assert.assertNotNull("Data on demand for 'Grade' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Grade' failed to provide an identifier", id);
        obj = Grade.findGrade(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Grade' with identifier '" + id + "'", Grade.findGrade(id));
    }
    
}
