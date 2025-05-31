package repository.exam;

import java.util.List;

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
        var em = getEntityManager();
        try {
            String jpql = "SELECT t FROM Template t WHERE t.isDisable = false ORDER BY t.templateId";
            return em.createQuery(jpql, Template.class)
                    .setFirstResult((pageIndex - 1) * pageSize) // offset
                    .setMaxResults(pageSize) // limit
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Template> findByField(String fieldName, Object value) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

}
