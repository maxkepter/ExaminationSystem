package repository.exam;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.exam.Template;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class TemplateDao extends DeactivatableObjectDao<Template> implements SearchableDao<Template> {

    public TemplateDao(EntityManagerFactory entityManagerFactory, Class<Template> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Template> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<Template> findByField(Map<String, Object> fieldValues) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

    public Template findByCode(String code) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            String jpql = "SELECT t FROM Template t WHERE t.code = :code AND t.isDisable = false";
            return em.createQuery(jpql, Template.class)
                    .setParameter("code", code)
                    .getSingleResult();
        } catch (jakarta.persistence.NoResultException e) {
            // Không tìm thấy
            return null;
        } finally {
            em.close();
        }
    }
}
